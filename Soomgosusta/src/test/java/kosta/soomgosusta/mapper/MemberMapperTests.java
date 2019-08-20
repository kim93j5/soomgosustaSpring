package kosta.soomgosusta.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

		@Setter(onMethod_=@Autowired)
		private MemberMapper mapper;
//		@Test
		public void testRegister(){
			
			MemberVO memberVO = new MemberVO();
			memberVO.setM_Id("test@naver.com");
			memberVO.setM_Password("kim1234");
			memberVO.setM_Name("kim");
			
			log.info(memberVO);
			mapper.register(memberVO);
			log.info(memberVO);
		}
		@Test
		public void testLogin(){
			
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setId("test@naver.com");
			loginDTO.setPassword("kim1234");
			
			MemberVO member = mapper.findMember(loginDTO.getId());
			log.info(member);
			if(member.getM_Id().equals(loginDTO.getId()) && member.getM_Password().equals(loginDTO.getPassword())){
				log.info("로그인성공");
			}else{
				log.info("로그인 실패");
			}
			
			
		}
}
