package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import com.config.ConfigManager;
import com.config.Configuration;
import com.google.gson.Gson;
import com.model.PersonData;

public class AngularJsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger LOG = Logger.getLogger(AngularJsServlet.class);
	public AngularJsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		String personJson = getPerson();
		String configJson = getConfig();
		
		response.setContentType("application/json");
//		response.getWriter().write(personJson);
		response.getWriter().write(configJson);
	}

	private String getConfig() {
		ConfigManager app = ConfigManager.instance();
		Configuration config = app.getConfig();
		String json = new Gson().toJson(config);
		LOG.debug(json);
		return json;
		
	}
	private String getPerson() {
		PersonData personData = new PersonData();
		personData.setFirstName("Mohaideen");
		personData.setLastName("Jamil");

		String json = new Gson().toJson(personData);
		return json;
	}

}
