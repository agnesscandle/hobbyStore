package algol;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Scanner;
import java.util.StringTokenizer;

public class algol {

	public static void main(String[] args) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		String[] fir = new String[5];
		
		try {
			for(int i=0;i<5;i++) {
				fir[i] = br.readLine();
			}
	
			for(int i=0;i<5;i++) {
				StringTokenizer st = new StringTokenizer(fir[i]); //StringTokenizer인자값에 입력 문자열 넣음
				int a = Integer.parseInt(st.nextToken()); //첫번째 호출
				int b = Integer.parseInt(st.nextToken()); //두번째 호출
				
				bw.write(String.valueOf(a+b));
				bw.newLine();
				bw.flush();
				
			}
		} catch (NumberFormatException | IOException e) {
			
			e.printStackTrace();
		}
		
		try {
			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
