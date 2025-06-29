import socket
import os
import urllib.parse

HOST = '0.0.0.0'
PORT = 8080
BUFFER_SIZE = 4096

def get_mime_type(filename):
    if filename.endswith('.html') or filename.endswith('.htm'):
        return 'text/html'
    elif filename.endswith('.c') or filename.endswith('.txt'):
        return 'text/plain'
    return 'application/octet-stream'

def build_response(path):
    if '..' in path:
        return b'HTTP/1.1 400 Bad Request\r\n\r\n400 Bad Request'

    filename = 'index.html' if path == '/' else path.lstrip('/')
    
    if not os.path.exists(filename):
        return b'HTTP/1.1 404 Not Found\r\nContent-Length: 13\r\n\r\n404 Not Found'
    
    if os.path.isdir(filename):
        return b'HTTP/1.1 403 Forbidden\r\n\r\n403 Forbidden'

    try:
        with open(filename, 'rb') as f:
            body = f.read()
    except Exception as e:
        print(f"Error reading file: {e}")
        return b'HTTP/1.1 500 Internal Server Error\r\n\r\n500 Internal Server Error'

    mime_type = get_mime_type(filename)
    header = f"HTTP/1.1 200 OK\r\nContent-Type: {mime_type}\r\nContent-Length: {len(body)}\r\n\r\n"
    return header.encode() + body

def run_server():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server_socket.bind((HOST, PORT))
        server_socket.listen(5)
        print(f"Serving on http://{HOST}:{PORT}")

        while True:
            client_socket, addr = server_socket.accept()
            with client_socket:
                try:
                    request = client_socket.recv(BUFFER_SIZE).decode('utf-8', errors='ignore')
                    if not request:
                        continue

                    lines = request.splitlines()
                    if not lines:
                        continue

                    method, path, *_ = lines[0].split()
                    print(f"Request: {method} {path}")

                    if method != 'GET':
                        response = b'HTTP/1.1 405 Method Not Allowed\r\n\r\n'
                    else:
                        path = urllib.parse.unquote(path)
                        response = build_response(path)

                    client_socket.sendall(response)
                except Exception as e:
                    print(f"Exception while handling request: {e}")

if __name__ == "__main__":
    run_server()

