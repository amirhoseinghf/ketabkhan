package controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import utils.Convertor;

public class Controller {
    private String sign_up(HashMap<String,String> dataMap) throws IOException {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            Path src = Paths.get("app/src/main/java/database/users.txt");
            List<String> lines = new ArrayList<>();
            lines.add(String.format("email: %s", dataMap.get("email")));
            lines.add(String.format("username: %s", dataMap.get("username")));
            lines.add(String.format("password: %s", dataMap.get("password")));
            Files.write(src, lines);
        }
        return "Done";

    }
    private String sign_in() {
        return "SDF";
    }

    public String start(String command, String data) throws IOException {
        HashMap<String,String> dataMap = Convertor.stringToMap(data);

        switch (command) {
            case "sign_up": return sign_up(dataMap);
            case "sign_in": return sign_in();

        }
    }
}
