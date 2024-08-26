package com.supellex.entity;

public class contact {
	private int idcontact;
	private int id_user_for_contact;
	private String email;
	private String subject;
	private String message;
	
	
	public contact(int idcontact, int id_user_for_contact, String email, String subject, String message) {
		super();
		this.idcontact = idcontact;
		this.id_user_for_contact = id_user_for_contact;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}
	public contact( int id_user_for_contact, String email, String subject, String message) {
		super();
		this.id_user_for_contact = id_user_for_contact;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}
	
	
	public int getIdcontact() {
		return idcontact;
	}
	public void setIdcontact(int idcontact) {
		this.idcontact = idcontact;
	}
	public int getId_user_for_contact() {
		return id_user_for_contact;
	}
	public void setId_user_for_contact(int id_user_for_contact) {
		this.id_user_for_contact = id_user_for_contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
