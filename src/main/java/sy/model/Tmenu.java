package sy.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Tmenu entity. @author MyEclipse Persistence Tools
 */

public class Tmenu implements java.io.Serializable {

	// Fields

	private String id;
	private Tmenu tmenu;
	private String text;
	private String iconCls;
	private String url;
	private Set tmenus = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tmenu() {
	}

	/** minimal constructor */
	public Tmenu(String id) {
		this.id = id;
	}

	/** full constructor */
	public Tmenu(String id, Tmenu tmenu, String text, String iconCls, String url, Set tmenus) {
		this.id = id;
		this.tmenu = tmenu;
		this.text = text;
		this.iconCls = iconCls;
		this.url = url;
		this.tmenus = tmenus;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Tmenu getTmenu() {
		return this.tmenu;
	}

	public void setTmenu(Tmenu tmenu) {
		this.tmenu = tmenu;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIconCls() {
		return this.iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Set getTmenus() {
		return this.tmenus;
	}

	public void setTmenus(Set tmenus) {
		this.tmenus = tmenus;
	}

}