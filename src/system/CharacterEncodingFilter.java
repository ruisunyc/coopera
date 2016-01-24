package system;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter  implements Filter {
	String encoding = null;
	FilterConfig filterConfig=null;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		this.encoding=null;
		this.filterConfig=null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// TODO Auto-generated method stub
		if(encoding!=null){
			request.setCharacterEncoding(encoding);
			response.setContentType("text/html;charset="+encoding);
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterConfig=filterConfig;
		this.encoding=filterConfig.getInitParameter(encoding);
	}

}
