package com.joshua.zangari.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joshua.zangari.models.Person;
import com.joshua.zangari.models.PersonRepository;

@Controller
public class PersonController {

    @Autowired
    private PersonRepository personRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listPeople(ModelMap model) {
	model.addAttribute("person", new Person());
	model.addAttribute("people", personRepository.findAll());
	return "people";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addPerson(@ModelAttribute("person") Person person,
	    BindingResult result) {
	personRepository.save(person);
	return "redirect:/";
    }

    @RequestMapping("/delete/{personId}")
    public String deletePerson(@PathVariable("personId") Long personId) {
	personRepository.delete(personRepository.findOne(personId));
	return "redirect:/";
    }

    @RequestMapping(value = "/update/{personId}", method = RequestMethod.GET)
    public String updatePersonDialog(@PathVariable("personId") Long personId,
	    ModelMap model) {
	Person person = personRepository.findOne(personId);
	model.addAttribute("person", person);
	return "updatePerson";
    }

    @RequestMapping(value = "/update/{personId}", method = RequestMethod.POST)
    public String updatePerson(@PathVariable("personId") Long personId, @ModelAttribute("person") Person person,
	    BindingResult result) {
	person.setId(personId);
	personRepository.save(person);
	return "redirect:/";
    }
}