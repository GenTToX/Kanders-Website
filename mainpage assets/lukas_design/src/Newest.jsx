import './Newest.css'
import { useEffect } from "react";

function Newest() {
    useEffect(() => {
        const cardContainer = document.getElementById("cardContainer")

        removeChildren()

        for(let i = 0; i<9; i++) {
            const item = document.createElement("div")
            item.className = "newest-item"
            item.id = i
            item.setAttribute('style', 'white-space: pre;');
            item.textContent = "Hi Max \nwhat up \n... "

            if(item.id%2) {
                item.style.backgroundColor = "#8080804a"
            }

            cardContainer.appendChild(item)
        }
    }, [])
    
    return(
        <>
            <section className='newest-section'>
                <div className='newest-top'>
                    <h1>Neuste Events</h1>
                    <a className='newEntry'>
                        <p className='newEntry-text'>Neuer Eintrag</p>
                    </a>
                </div>
                
                <div id='cardContainer' className='newest-cards-container'>
                    <div className='newest-item'></div>
                </div>
            </section>
        </>
    )
}

function removeChildren(){
    let children = document.querySelectorAll(".newest-item")
    children.forEach((item) => {
        item.remove()
    })
}

export default Newest