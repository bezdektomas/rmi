package shared;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

import shared.data.Trida;

public interface Tridy extends Remote { // rozhraní Remote říká, že toto bude služba pro proxy objekt
    List<Trida> getTridy() throws RemoteException; //remote metody mohou vyvolat RemoteException

    Trida getTrida(int id) throws RemoteException;

    boolean writeTrida(Trida trida) throws RemoteException;
}
