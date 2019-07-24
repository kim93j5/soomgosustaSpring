package kosta.soomgosusta.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.joda.time.DateTime;
import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.RequestDTO;
import kosta.soomgosusta.domain.RequestDetailDTO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.service.PartService;
import kosta.soomgosusta.service.RequestService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/request/*")
@AllArgsConstructor
public class RequestController {

	private RequestService requestService;

	@GetMapping("/sendRequest")
	public void sendRequest() {

	}

}
