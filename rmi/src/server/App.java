package server;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {

        Registry reg;
        try {
            reg = LocateRegistry.createRegistry(12345); // port, na kterém aplikace naslouchá
            reg.rebind("tridy", new Tridy()); // zaregistrování služby, kterou aplikace poskytuje
            System.out.println("Server ready");
            
        } catch (RemoteException e) {
            e.printStackTrace();
        }

    }
}
