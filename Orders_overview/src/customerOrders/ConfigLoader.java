package customerOrders;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ConfigLoader {

    public static Map<String, String> loadConfig() throws IOException {
        final Map<String, String> map = new HashMap<>();

        // final File FILE = new File("C:\\Users\\okovalchuk\\Workspace\\Azubi_Oleh\\AufgabenOleh\\src\\main\\resources\\application.properties");
        final InputStream input = ConfigLoader.class.getClassLoader().getResourceAsStream("application.properties");

        String line = "";
        try (final Scanner scanner = new Scanner(input)) {
            while (scanner.hasNextLine()) {
                line = scanner.nextLine();
                String[] kv = line.split("=");
                map.put(kv[0], kv[1]);
            }

        }
        return map;
    }
}

