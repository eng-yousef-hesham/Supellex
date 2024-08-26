package com.supellex.entity;

public class password {
	private int idpassword;
	private String passwordcol;
	public password()
	{
		super();
	}
	public password(int idpassword, String passwordcol) {
		super();
		this.idpassword = idpassword;
		this.passwordcol = passwordcol;
	}

	public int getIdpassword() {
		return idpassword;
	}

	public void setIdpassword(int idpassword) {
		this.idpassword = idpassword;
	}

	public String getPasswordcol() {
		return passwordcol;
	}

	public void setPasswordcol(String passwordcol) {
		this.passwordcol = passwordcol;
	}

}
