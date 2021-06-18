package main;

import courier.*;
import food.Local;
import food.Produs;
import order.Comanda;
import order.Review;
import order.User;
import services.Serviciu;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

public class Main {
    public static void main(String[] args) throws InstantiationException, IllegalAccessException, SQLException, FileNotFoundException {
        Serviciu myService = new Serviciu();
        myService.executeServices();
    }
}
