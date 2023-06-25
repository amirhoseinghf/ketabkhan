package network;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    public void start() throws IOException {
        ServerSocket ss = new ServerSocket(2424);
        while(true) {
            Socket socket = ss.accept();
        }
    }
}
