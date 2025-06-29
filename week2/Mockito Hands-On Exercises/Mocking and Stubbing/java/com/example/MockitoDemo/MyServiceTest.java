package com.example.MockitoDemo;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Test;

public class MyServiceTest {

    @Test
    public void testMockingAndStubbing() {
        // Step 1: Create mock
        ExternalApi mockApi = mock(ExternalApi.class);

        // Step 2: Stub getData to return "Mock Data"
        when(mockApi.getData()).thenReturn("Mock Data");

        // Step 3: Inject into service
        MyService service = new MyService(mockApi);

        // Call method
        String result = service.fetchData();

        // Assert that returned data matches stubbed data
        assertEquals("Mock Data", result);
    }
}
