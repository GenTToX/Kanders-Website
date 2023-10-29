import './Hero.css'
let i = 1
let url = window.location.href

function Hero() {
    return(
        <>
            <section className='hero-section'>
                <div className='hero-card'>
                    <img id='img1' src='https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bXVzaWN8ZW58MHx8MHx8fDA%3D'></img>
                    <img id='img2' src='https://images.unsplash.com/photo-1459749411175-04bf5292ceea?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fG11c2ljfGVufDB8fDB8fHww'></img>
                    <img id='img3' src='https://images.unsplash.com/photo-1477233534935-f5e6fe7c1159?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fG11c2ljfGVufDB8fDB8fHww'></img>
                </div>
                <div className='hero-card-shadow'></div>
                <div className='arrow-container' id='arrowContainer'>
                        <a onClick={prevImg} className='arrow-left'>
                            <svg id='arrow-left' width="5vh" height="5vh" viewBox="0 0 24 24" fill="#fff" xmlns="http://www.w3.org/2000/svg">
                                <path d="M16.1795 3.26875C15.7889 2.87823 15.1558 2.87823 14.7652 3.26875L8.12078 9.91322C6.94952 11.0845 6.94916 12.9833 8.11996 14.155L14.6903 20.7304C15.0808 21.121 15.714 21.121 16.1045 20.7304C16.495 20.3399 16.495 19.7067 16.1045 19.3162L9.53246 12.7442C9.14194 12.3536 9.14194 11.7205 9.53246 11.33L16.1795 4.68297C16.57 4.29244 16.57 3.65928 16.1795 3.26875Z"></path> 
                            </svg>
                        </a>
                        <a onClick={nextImg} className='arrow-right'>
                            <svg id='arrow-right' width="5vh" height="5vh" viewBox="0 0 24 24" fill="#fff" xmlns="http://www.w3.org/2000/svg">
                                <path d="M16.1795 3.26875C15.7889 2.87823 15.1558 2.87823 14.7652 3.26875L8.12078 9.91322C6.94952 11.0845 6.94916 12.9833 8.11996 14.155L14.6903 20.7304C15.0808 21.121 15.714 21.121 16.1045 20.7304C16.495 20.3399 16.495 19.7067 16.1045 19.3162L9.53246 12.7442C9.14194 12.3536 9.14194 11.7205 9.53246 11.33L16.1795 4.68297C16.57 4.29244 16.57 3.65928 16.1795 3.26875Z"></path> 
                            </svg>
                        </a>
                    </div>
            </section>
        </>
    )
}

function nextImg() {
    if(i == 3) {
        i = 1
    } else { i++ }
    window.location.replace('http://localhost:5173/#img' + i)
    console.log("next")
}
function prevImg() {
    if(i == 1) {
        i = 3
    } else { i-- }
    window.location.replace('http://localhost:5173/#img' + i)
    console.log("previous")
}

var intervalId = window.setInterval(function(){
    nextImg()
  }, 5000);


function onload() {
    if(url = 'http://localhost:5173/') {return}
    window.location.replace('http://localhost:5173/')
}
onload()
export default Hero