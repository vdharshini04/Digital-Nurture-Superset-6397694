package com.example.MockitoDemo;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Test;

public class MyServiceTest {

	@Test
    public void testVerifyInteraction() {
        // Step 1: Create mock
        ExternalApi mockApi = mock(ExternalApi.class);

        // Optional stub (not strictly required)
        when(mockApi.getData()).thenReturn("Any Data");

        // Step 2: Inject into service
        MyService service = new MyService(mockApi);

        // Step 3: Call method
        service.fetchData();

        // Step 4: Verify that getData() was called exactly once
        verify(mockApi).getData();
	}
}
