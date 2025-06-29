#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>

#define PORT 8080
#define BUFFER_SIZE 4096

const char *get_mime_type(const char *filename) {
    const char *ext = strrchr(filename, '.');
    if (!ext) return "application/octet-stream";
    if (strcmp(ext, ".html") == 0) return "text/html";
    if (strcmp(ext, ".htm") == 0)  return "text/html";
    if (strcmp(ext, ".c") == 0)    return "text/plain";
    if (strcmp(ext, ".txt") == 0)  return "text/plain";
    return "application/octet-stream";
}

void serve_file(int client_socket, const char *filepath) {
    char buffer[BUFFER_SIZE];

    // Prevent directory traversal
    if (strstr(filepath, "..")) {
        const char *bad_request = "HTTP/1.1 400 Bad Request\r\n\r\n400 Bad Request";
        write(client_socket, bad_request, strlen(bad_request));
        return;
    }

    // Default to index.html if "/"
    const char *filename = strcmp(filepath, "/") == 0 ? "index.html" : filepath + 1;

    int file = open(filename, O_RDONLY);
    if (file < 0) {
        const char *not_found = "HTTP/1.1 404 Not Found\r\nContent-Length: 13\r\n\r\n404 Not Found";
        write(client_socket, not_found, strlen(not_found));
        return;
    }

    const char *mime_type = get_mime_type(filename);

    // Prepare and send HTTP header
    char header[BUFFER_SIZE];
    snprintf(header, sizeof(header),
             "HTTP/1.1 200 OK\r\nContent-Type: %s\r\n\r\n", mime_type);
    write(client_socket, header, strlen(header));

    // Send file contents
    ssize_t bytes;
    while ((bytes = read(file, buffer, BUFFER_SIZE)) > 0) {
        write(client_socket, buffer, bytes);
    }

    close(file);
}

void handle_connection(int client_socket) {
    char request[BUFFER_SIZE] = {0};
    read(client_socket, request, BUFFER_SIZE - 1);

    char method[8], path[1024];
    sscanf(request, "%7s %1023s", method, path);

    if (strcmp(method, "GET") != 0) {
        const char *not_allowed = "HTTP/1.1 405 Method Not Allowed\r\n\r\n";
        write(client_socket, not_allowed, strlen(not_allowed));
        return;
    }

    serve_file(client_socket, path);
}

int main() {
    int server_fd, client_socket;
    struct sockaddr_in address;
    socklen_t addrlen = sizeof(address);

    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    if (listen(server_fd, 3) < 0) {
        perror("listen");
        exit(EXIT_FAILURE);
    }

    printf("Server listening on http://localhost:%d\n", PORT);

    while (1) {
        client_socket = accept(server_fd, (struct sockaddr *)&address, &addrlen);
        if (client_socket < 0) {
            perror("accept");
            continue;
        }

        handle_connection(client_socket);
        close(client_socket);
    }

    close(server_fd);
    return 0;
}

