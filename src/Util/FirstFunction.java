package Util;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class FirstFunction {
	
	public static void srcGuGudan(JspWriter out) {
		try{
			out.println("<table border='1'>");
			//단만큼 반복한다.
			for(int dan=2 ; dan<=9 ; dan++){
				out.println("<tr>");
				//수만큼 반복한다.
				for(int su=1 ; su<=9 ; su++){
					out.println("<td>"+dan+"*"+su+"="+(dan*su)+"</td>");
				}
				out.println("</tr>");
			}	
			out.println("</table>");			
		}
		catch(IOException e){
			
		}
	}
}
