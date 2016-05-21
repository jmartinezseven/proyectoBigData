/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Principal;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.List;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 *
 * @author CAMILO
 */
public class Main {

    public static void main(String[] args) throws TwitterException {
        // TODO code application logic here
        ConfigurationBuilder cf = new ConfigurationBuilder();
        
        cf.setDaemonEnabled(true)
                .setOAuthConsumerKey("2drJC0Py79CQrZGc5sMLH2Nm8")
                .setOAuthConsumerSecret("CEopeeujhMdn61HSto3uInilYnrDF84w3T2Obf4GEnBn2pStod")
                .setOAuthAccessToken("538836265-FV35zw4GkZqWrBUikDBvQGHN9ZYBpzmLPZNyaTqU")
                .setOAuthAccessTokenSecret("9QkDZN1caIkFQmZ7Mo0imMmdGyKoabsAfMxFqU2fIvHQj");
        
        TwitterFactory tf = new TwitterFactory(cf.build());
        QueryTwitter(tf, "poligran");
        QueryTwitter(tf, "ingenieria de sistemas");
        QueryTwitter(tf, "materias ingenieria");
        QueryTwitter(tf, "Horario Poligran");
        QueryTwitter(tf, "Politenico Grancolombiano");
    }
    
    public static void QueryTwitter(TwitterFactory tf, String PalabraClave){
        twitter4j.Twitter twitter = tf.getInstance();
        
        //get username, status
        
        try {
        	File archivo = new File("Archivos/Info.txt");
            Query query = new Query(PalabraClave);
            QueryResult result;
            result = twitter.search(query);
            List<Status> tweets = result.getTweets();
            for (Status tweet : tweets) {
                System.out.println("@" + tweet.getUser().getScreenName() + " - " + tweet.getText()+"-"+tweet.getPlace()+"-"+tweet.getCreatedAt());
	            try{
		 			FileWriter escribirArchivo = new FileWriter(archivo, true);
		 			BufferedWriter buffer = new BufferedWriter(escribirArchivo);
		 			buffer.write("@" + tweet.getUser().getScreenName() + " :: " + tweet.getText() + "::" +tweet.getPlace()+ "::"+ tweet.getCreatedAt()+"::"+PalabraClave+"::"+"Twitter");
		 			buffer.newLine();
		 			buffer.close();
		 		}catch(Exception e){
		 		}
            }
            System.exit(0);
        } catch (TwitterException te) {
            te.printStackTrace();
            System.out.println("Failed to search tweets: " + te.getMessage());
            System.exit(-1);
        }      
    }
    
}

