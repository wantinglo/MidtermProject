package tw.wantinglo.model.manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class manageService {
	private manageDAO mdao;
	@Autowired
	public manageService(manageDAO mdao) {
		this.mdao = mdao;
	}

	public Manage isExist(Manage manage) {
		Manage manage_check = mdao.isExist(manage);
		return manage_check;
	}

}
