package xml.parsing.example; 
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
 
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
 
public class XmlParser1 {
	
	
	private String getTextValue(String def, Element doc, String tag) {
	    String value = def;
	    NodeList nl;
	    nl = doc.getElementsByTagName(tag);
	    if (nl.getLength() > 0 && nl.item(0).hasChildNodes()) {
	        value = nl.item(0).getFirstChild().getNodeValue();
	    }
	    return value;
	}
	
    public void getAllUserNames() {
    	
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            File file = new File("C:\\Users\\Student\\Desktop\\JAVA LAB\\New folder\\IPL2015\\WebContent\\myOutput.xml");
            
            if (file.exists()) {
            	
                Document doc = db.parse(file);
                Element docEle = doc.getDocumentElement();
 
                // Print root element of the document
                System.out.println("Root element of the document: "
                        + docEle.getNodeName());
 
                NodeList matchList = docEle.getElementsByTagName("match");
 
                // Print total matches elements in document
                System.out
                        .println("Total mtaches: " + matchList.getLength());
 
                if (matchList != null && matchList.getLength() > 0) {
                    for (int i = 0; i < matchList.getLength(); i++) {
 
                        Node node = matchList.item(i);
 
                        if (node.getNodeType() == Node.ELEMENT_NODE) {
 
                            System.out
                                    .println("=====================");
 
                            Element e = (Element) node;
                            
                            NodeList nodeList = e.getElementsByTagName("mchDesc");
                            System.out.println("Match Detail: "
                                    + matchList.item(i).getChildNodes().item(0)
                                            .getNodeValue());
                            if (nodeList.getLength() > 0) {
                               // System.out.println( nodeList.item(0).ge);
                            }
                            System.out.println("Match Detail: "
                                    + nodeList.item(0).getChildNodes().item(0)
                                            .getNodeValue());
                            	
                            nodeList = e.getElementsByTagName("srs");
                            System.out.println("Series: "
                                    + nodeList.item(0).getChildNodes().item(0)
                                            .getNodeValue());
 
                            nodeList = e.getElementsByTagName("grnd");
                            System.out.println("Ground: "
                                    + nodeList.item(0).getChildNodes().item(0)
                                            .getNodeValue());
                        }
                    }
                } else {
                    System.exit(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
         
        XmlParser1 parser = new XmlParser1();
        parser.getAllUserNames();
    }
}