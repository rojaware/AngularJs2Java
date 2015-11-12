/**
 * 
 */
package com.service;

import com.config.ConfigManager;
import com.config.Configuration;

/**
 * @author giwon
 *
 */
public class MockService {

	public Configuration getConfig() {
		System.out.println("Hello YAML Config World!");

		ConfigManager app = ConfigManager.instance();
		Configuration config = app.getConfig();
        return config;
	}
}
