package models;

public class PointData {
    private final Coordinates coordinates;
    private final String isHit;
    private final String currentDate;
    private final double scriptRunningTime;

    public PointData(Coordinates coordinates, String isHit, String currentDate, double scriptRunningTime) {
        this.coordinates = coordinates;
        this.isHit = isHit;
        this.currentDate = currentDate;
        this.scriptRunningTime = scriptRunningTime;
    }

    public String getIsHit() {
        return isHit;
    }

    public Coordinates getCoordinates() {
        return coordinates;
    }

    public String getCurrentDate() {
        return currentDate;
    }

    public double getScriptRunningTime() {
        return scriptRunningTime;
    }

    @Override
    public String toString() {
        return "PointData{" +
                "coordinates=" + coordinates.toString() +
                ", isHit='" + isHit + '\'' +
                ", currentDate='" + currentDate + '\'' +
                ", scriptRunningTime=" + scriptRunningTime +
                '}';
    }
}
