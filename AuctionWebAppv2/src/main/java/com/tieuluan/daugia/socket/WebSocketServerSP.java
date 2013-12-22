package com.tieuluan.daugia.socket;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;


public class WebSocketServerSP extends WebSocketServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static ArrayList<MyMessageInbound> mmiListRe = new ArrayList<MyMessageInbound>();
	
	@Override
	protected StreamInbound createWebSocketInbound(String arg0,
			HttpServletRequest arg1) {
		// TODO Auto-generated method stub
		return new MyMessageInbound();
	}

	private class MyMessageInbound extends MessageInbound{
		WsOutbound myoutBound;
		
		@Override
		protected void onClose(int status) {
			System.out.print("Close Client Dang SP");
			mmiListRe.remove(this);
		}

		@Override
		protected void onOpen(WsOutbound outbound) {
			//1 client da ket noi toi server
			System.out.println("Open Client Dang SP");
			//String json = getMessageJson(arg0.toString());
			this.myoutBound  = outbound;
			mmiListRe.add(this);
		}

		@Override
		protected void onBinaryMessage(ByteBuffer arg0) throws IOException {
			// TODO Auto-generated method stub
			
		}

		@Override
		protected void onTextMessage(CharBuffer arg0) throws IOException {
			// TODO Auto-generated method stub
			System.out.println("Accept Message : " + arg0);
			
			for(MyMessageInbound mmib : mmiListRe){
				CharBuffer buffer = CharBuffer.wrap(arg0);
				mmib.myoutBound.writeTextMessage(buffer);
				mmib.myoutBound.flush();
			}
		}
	}
}
