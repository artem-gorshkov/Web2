package utils;

import app.models.Point;

import java.io.Serializable;
import java.util.Deque;
import java.util.LinkedList;

public class DataBean implements Serializable {

    private final Deque<Point> data;

    public DataBean() {
        data = new LinkedList<>();
    }

    public DataBean(Deque<Point> data) {
        this.data = data;
    }

    public Deque<Point> getData() {
        return data;
    }
}