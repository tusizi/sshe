package sy.action;

import java.awt.Menu;

import org.apache.struts2.convention.annotation.Action;

import com.opensymphony.xwork2.ModelDriven;

@Action(value = "menuAction")
public class MenuAction extends BaseAction implements ModelDriven<Menu> {
	private Menu menu = new Menu();

	@Override
	public Menu getModel() {
		
		return menu;
	}

}
