package sy.pageModel;

import java.util.ArrayList;
import java.util.List;

public class DataGrid {
	private Long total = 0L;
	private List rows = new ArrayList();

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long totle) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

}
