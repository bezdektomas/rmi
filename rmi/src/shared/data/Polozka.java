package shared.data;

import java.io.Serializable;

public abstract class Polozka implements Serializable { //rozhrani Serializable umoznuje zabalit a poslat objekty proxy tunelem
    protected int id;

    public int getId() {
        return id;
    }

    public Polozka setId(int id) {
        this.id = id;
        return this;
    }
}
