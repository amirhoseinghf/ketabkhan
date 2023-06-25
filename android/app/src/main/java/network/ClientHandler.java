package network;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.text.Format;
import java.util.Formatter;
import java.util.Scanner;

public class ClientHandler extends Thread {
    private Socket socket;

    ClientHandler(Socket socket) {this.socket = socket;}

    @Override
    public void run() {
        try {
            DataInputStream dis = new DataInputStream(socket.getInputStream());
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());

            StringBuilder request = new StringBuilder();
            int c = dis.read();
            while(c != 0) {
                request.append((char) c);
                c = dis.read();
            }

            // TODO


            String response = "";
            dos.writeBytes(response);
            dos.flush();
            dos.close();
            dis.close();
            socket.close();


        } catch (IOException e) {

        }
    }
}
