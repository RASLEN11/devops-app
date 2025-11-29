package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class AppTest {
    
    @Test
    public void testGetGreeting() {
        App app = new App();
        assertEquals("Hello DevOps World - Enhanced with New Features!", app.getGreeting());
    }
    
    @Test
    public void testAdd() {
        App app = new App();
        assertEquals(5, app.add(2, 3));
        assertEquals(10, app.add(5, 5));
        assertEquals(0, app.add(0, 0));
    }
    
    @Test
    public void testMultiply() {
        App app = new App();
        assertEquals(6, app.multiply(2, 3));
        assertEquals(0, app.multiply(5, 0));
        assertEquals(25, app.multiply(5, 5));
    }
    
    @Test
    public void testMainMethod() {
        // Test that main method runs without exceptions
        try {
            App.main(new String[]{});
            assertTrue(true); // If we reach here, main executed successfully
        } catch (Exception e) {
            fail("Main method should not throw exceptions");
        }
    }
}
