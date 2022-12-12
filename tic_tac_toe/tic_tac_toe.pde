
import java.awt.BasicStroke;
import java.awt.Canvas;
import java.awt.Color;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GridLayout;
import java.util.Random;
import java.util.Scanner;


class Cell extends Canvas{
        private String player = "";
        @Override
        public void paint(Graphics g){
            Graphics2D g2d = (Graphics2D)g;
            if(player.equals("O")){
                g2d.setColor(Color.magenta);
                g2d.fillOval(10, 5, 140, 140);
            }
            else if(player.equals("X")){
                g2d.setColor(Color.green);
                g2d.setStroke(new BasicStroke(3));
                g2d.drawLine(0, 0, 168, 160);
                g2d.drawLine(168, 0, 0, 160);
            }
            
        }
        
        public void setPlayer(String p){
            player = p;
        }
        public String getPlayer(){
            return player;
        }
    }

public class Main {
    static void user(Cell [][]m){
        int n;
        String mat;
        Scanner in = new Scanner(System.in);
        System.out.println("Enter cell number (0 - 8): ");
        
        n = in.nextInt();
        while(n<0 || n> 8){
            n = in.nextInt();
        }
        
        mat = m[n/3][n%3].getPlayer();
        if("X".equals(mat) || "O".equals(mat))
            user(m);
        
        m[n/3][n%3].setPlayer("X");
        m[n/3][n%3].repaint();
    }
    
    static void computer(Cell [][]m){
        int n;
        String mat;
        Random rand = new Random();
        
        n = rand.nextInt(9);
        
        
        mat = m[n/3][n%3].getPlayer();
        if("X".equals(mat) || "O".equals(mat))
            computer(m);
        
        m[n/3][n%3].setPlayer("O");
        m[n/3][n%3].repaint();
    }
    
    static String checkWinner(Cell[][]mat)
    {
        int i;
        int j;
        int c = 0;
        for (int a = 0; a < 8; a++) {
            String line = "";
 
            switch (a) {
            case 0:
                line = mat[0][0].getPlayer() + mat[0][1].getPlayer() + mat[0][2].getPlayer()+"";
                break;
            case 1:
                line = mat[1][0].getPlayer() + mat[1][1].getPlayer() + mat[1][2].getPlayer()+"";
                break;
            case 2:
                line = mat[2][0].getPlayer() + mat[2][1].getPlayer() + mat[2][2].getPlayer()+"";
                break;
            case 3:
                line = mat[0][0].getPlayer() + mat[1][0].getPlayer() + mat[2][0].getPlayer()+"";
                break;
            case 4:
                line = mat[0][1].getPlayer() + mat[1][1].getPlayer() + mat[2][1].getPlayer()+"";
                break;
            case 5:
                line = mat[0][2].getPlayer() + mat[1][2].getPlayer() + mat[2][2].getPlayer()+"";
                break;
            case 6:
                line = mat[0][0].getPlayer() + mat[1][1].getPlayer() + mat[2][2].getPlayer()+"";
                break;
            case 7:
                line = mat[0][2].getPlayer() + mat[1][1].getPlayer() + mat[0][2].getPlayer()+"";
                break;
            }
           
            
            if (line.equals("XXX")) {
                return "X";
            }
             
            
            else if (line.equals("OOO")) {
                return "O";
            }
        }
         
        for(i=0; i<3; i++){
            for(j=0; j<3; j++){
                if("X".equals(mat[i][j].getPlayer()) || "O".equals(mat[i][j].getPlayer())){
                    c++;
                }
                if(c == 9){
                    return "D";
                }
            }
        }

        return null;
    }
    
    public static void main(String []args){
        
        Cell[][] can = new Cell[3][3];
        int i;
        int j;
        
        Frame f = new Frame("Tic-Tac-Toe Game");
        f.setLayout(new GridLayout(3, 3));
        f.setSize(500, 500);
        
        
        for(i=0; i<3; i++){
            for(j=0; j<3; j++){
                can[i][j] = new Cell();
                 
                
                
                can[i][j].setBackground(Color.black);
                f.add(can[i][j]);
                
            }
        }
        
     
        f.setVisible(true);
        while(checkWinner(can) == null){
            computer(can);
            if("O".equals(checkWinner(can))){
                System.out.println("Computer won");
                break;
            }
            user(can);
            if("X".equals(checkWinner(can))){
                System.out.println("User won");
                break;
            }
        }
        
            
    }
    
}
