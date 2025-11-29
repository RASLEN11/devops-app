package com.example;

public class App {
    public String getGreeting() {
        return "Hello DevOps World from Java Maven Project!";
    }
    
    public int add(int a, int b) {
        return a + b;
    }
    
    public int multiply(int a, int b) {
        return a * b;
    }
    
    public static void main(String[] args) {
        App app = new App();
        System.out.println(app.getGreeting());
        System.out.println("2 + 3 = " + app.add(2, 3));
        System.out.println("2 * 3 = " + app.multiply(2, 3));
    }
}
