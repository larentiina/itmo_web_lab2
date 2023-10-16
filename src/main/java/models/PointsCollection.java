package models;

import java.util.LinkedList;

public class PointsCollection {
    private LinkedList<PointData> collection = new LinkedList<>();

    public LinkedList<PointData> getCollection() {
        return collection;
    }
    public void addElement(PointData pointData){
        collection.add(pointData);
    }
    public int size(){
        return collection.size();
    }
}
