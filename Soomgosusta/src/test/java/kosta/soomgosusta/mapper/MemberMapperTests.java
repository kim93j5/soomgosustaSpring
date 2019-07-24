package kosta.soomgosusta.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
		
		@Test
		public void testRegister(){
			
			MemberVO memberVO = new MemberVO();
			memberVO.setM_Id("kim4@naver.com");
			memberVO.setM_Password("kim1234");
			memberVO.setM_Name("kim");
			
			log.info(memberVO);
			mapper.register(memberVO);
			log.info(memberVO);
		}
}
