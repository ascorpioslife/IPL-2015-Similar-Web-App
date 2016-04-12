package xml.parsing.example;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class XmlParser {
    public static void main (String[] args) throws IOException, ParserConfigurationException, SAXException, TransformerException {
        URL url = new URL("http://synd.cricbuzz.com/j2me/1.0/livematches.xml");
        
        URLConnection conn = url.openConnection();

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(conn.getInputStream());

        TransformerFactory tfactory = TransformerFactory.newInstance();
        Transformer xform = tfactory.newTransformer();

        // that’s the default xform; use a stylesheet to get a real one
       // xform.transform(new DOMSource(doc), new StreamResult(System.out));
        
        File myOutput = new File("C:\\Users\\Student\\Desktop\\New folder\\myOutput.xml");
        xform.transform(new DOMSource(doc), new StreamResult(myOutput));
    }
}