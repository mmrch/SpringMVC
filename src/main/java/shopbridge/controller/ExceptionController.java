package shopbridge.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.persistence.EntityNotFoundException;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;

@ControllerAdvice
public class ExceptionController {
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = NullPointerException.class)
	public String excHandlerNull(Model m) {
		m.addAttribute("exception_message", "Null Pointer exception has occured");
		return "exception";
	}

	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = NumberFormatException.class)
	public String excHandlerNumberFormat(Model m) {
		m.addAttribute("exception_message", "Number format exception has occured");
		return "exception";
	}

	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = EntityNotFoundException.class)
	public String excHandlerGeneral(Model m) {
		m.addAttribute("exception_message", "Exception has occured");
		return "exception";
	}
}
