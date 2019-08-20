function animate() {
        if (stars.length<300&&Math.random()>.1){ // if fewer than 300 stars, a 10% chance of creating a new one
                let star={x:0,y:0,vx:-5+Math.random()*10,vy:-5+Math.random()*10} // create a new star in the middle with random velocity
                stars.push(star); // add the star to the array
                }
        context.clearRect(0, 0, canvas.width, canvas.height); // clear the frame
        for(let n=0;n<stars.length;n++){ // for each star
                stars[n].x=stars[n].x+stars[n].vx; // add the velocity to the current position
                stars[n].y=stars[n].y+stars[n].vy; // in both axles
	        if(stars[n].x>400||stars[n].x<-400){ // if the star is out of bounds
                        stars[n].x=0;  // put it back in the center
                        stars[n].y=0;
                }
		zh=Math.floor((Math.abs(stars[n].x)+Math.abs(stars[n].y))/5);
	    context.fillStyle = 'rgb('+zh+','+zh+','+zh+')'; // use the hex value for the R, G and B component
        context.beginPath();
        context.arc(400+stars[n].x, 400+stars[n].y, Math.abs(stars[n].y/100+n/200), 0, 2 * Math.PI); // draw a circle
        context.fill();
        }
        window.requestAnimationFrame(animate); // request another animation frame
}
let canvas = document.getElementById('myCanvas');
let context = canvas.getContext('2d');
let stars=[]; // the array of stars
window.requestAnimationFrame(animate); // initialize the animation
