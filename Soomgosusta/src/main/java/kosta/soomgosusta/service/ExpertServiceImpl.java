package kosta.soomgosusta.service;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.soomgosusta.domain.E_FilesVO;
import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.mapper.ExpertMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ExpertServiceImpl implements ExpertService {

	@Setter(onMethod_ = @Autowired)
	private ExpertMapper mapper;

	@Override
	public void register(ExpertVO expertVO) throws UnsupportedEncodingException {

		String target = expertVO.getE_Password();
		byte[] targetBytes = target.getBytes("utf-8");

		Encoder encoder = Base64.getEncoder();

		byte[] encodeBytes = encoder.encode(targetBytes);
		System.out.println(new String(encodeBytes));

		String password = encoder.encodeToString(targetBytes);
		System.out.println(password);

		expertVO.setE_Password(password);
		log.info(expertVO.getE_Password());
		mapper.register(expertVO);

		log.info(expertVO);

	}

	@Override
	public int login(LoginDTO loginDTO) throws UnsupportedEncodingException {

		String login_Id = loginDTO.getId();
		ExpertVO expertVO = mapper.findExpert(login_Id);

		Decoder decoder = Base64.getDecoder();

		byte[] decodeBytes = decoder.decode(expertVO.getE_Password());
		String password = new String(decodeBytes, "UTF-8");
			
		System.out.println("=========login_service pass ========" + password);
		
			if (loginDTO.getId().equals(expertVO.getE_Id()) && loginDTO.getPassword().equals(password)) {
			loginDTO.setSuccess(0);
			return loginDTO.getSuccess();
			}else if(loginDTO.getId().equals(expertVO.getE_Id())){
			loginDTO.setSuccess(1);
			return loginDTO.getSuccess();
			}else{
			loginDTO.setSuccess(2);
			return loginDTO.getSuccess();
			}
		
		

	}

	@Override
	public ExpertVO findExpert(String login_Id) {
		ExpertVO expertVO = mapper.findExpert(login_Id);
		return expertVO;
	}

	@Override
	public E_ProfileVO getProfile(String e_Id) {
		E_ProfileVO profile = mapper.getProfile(e_Id);
		return profile;
	}

	@Override
	public int updateEPhoto(Map<String, String> param) {

		return mapper.updateEPhoto(param);
	}

	@Override
	public int updateProfile(E_ProfileVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateProfile(vo);
	}

	@Transactional
	@Override
	public void insertExpertInfo(ExpertInfoVO expert_Info, int p_Seq) {

		// log.info("get...." + expert_Info);
		mapper.insertExpertInfo(expert_Info);
		mapper.countRegister(p_Seq);
	}

	@Override
	public void uploadFile(E_FilesVO vo) {
		mapper.uploadLicense(vo);
		
	}

	@Override
	public void licenseDelete(String ef_Uuid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<E_FilesVO> getFileList(String e_Id) {
		
		return mapper.getFileList(e_Id);
	}

}
