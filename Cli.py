import psutil
import speedtest
import socket

def get_network_speed():
    st = speedtest.Speedtest()
    download_speed = st.download() / 10**6  # in Mbps
    upload_speed = st.upload() / 10**6  # in Mbps
    return download_speed, upload_speed

def get_connected_devices():
    connections = psutil.net_connections(kind='inet')
    connected_devices = set()

    for conn in connections:
        if conn.raddr and conn.raddr.ip not in ['127.0.0.1', '0.0.0.0']:
            device_info = {
                'ip': conn.raddr.ip,
                'port': conn.raddr.port,
                'status': conn.status,
                'type': socket.getservbyport(conn.raddr.port, 'tcp') if conn.type == socket.SOCK_STREAM else 'UDP',
            }
            connected_devices.add(device_info)

    return connected_devices

def get_network_status():
    # Check if the system is connected to the internet
    return psutil.net_if_stats().get('en0', {}).get('isup', False)  # Adjust the interface name as needed

def ping_host(host):
    # Implement a ping tool to check network connectivity and latency
    # Use the 'ping' command or a library like pythonping
    pass

def main():
    while True:
        download_speed, upload_speed = get_network_speed()
        connected_devices = get_connected_devices()
        network_status = get_network_status()

        print(f"Download Speed: {download_speed:.2f} Mbps")
        print(f"Upload Speed: {upload_speed:.2f} Mbps")

        if network_status:
            print("Network Status: Connected")
        else:
            print("Network Status: Disconnected")

        if connected_devices:
            print("\nConnected Devices:")
            for device in connected_devices:
                print(f"IP: {device['ip']}, Port: {device['port']}, Status: {device['status']}, Type: {device['type']}")

        # Add more functionalities and information as needed
        host_to_ping = 'google.com'
        ping_result = ping_host(host_to_ping)
        print(f"Ping to {host_to_ping}: {ping_result}")

        # Add more features like DNS lookup, geolocation, packet sniffing, etc.

if __name__ == "__main__":
    main()
