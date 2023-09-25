document.addEventListener("DOMContentLoaded", function() {
    // Button-Element abrufen
    const addButton = document.getElementById("addTextFieldButton");
    const deleteButton = document.getElementById("deleteTextFieldButton");

    // Container für die Textfelder abrufen
    const textFieldContainer = document.getElementById("textFieldContainer");

    // Counter, um die Anzahl der generierten Textfelder zu verfolgen
    let textFieldCount = 1;

    // Maximal erlaubte Anzahl von Textfeldern
    const maxTextFieldCount = 6;

    // Event-Handler für den Button hinzufügen
    addButton.addEventListener("click", function() {
        
        // Überprüfen, ob die maximale Anzahl von Textfeldern erreicht wurde
        if (textFieldCount < maxTextFieldCount) {
            
            // Ein neues Textfeld erstellen
            const textField = document.createElement("input");
            textField.type = "text";
            textField.placeholder = "Lorem Ipsum";
            textField.id = textFieldCount;

            if(textField.id == 2) {
                textField.placeholder = "test";
            }

            // Das Textfeld dem Container hinzufügen
            textFieldContainer.appendChild(textField);
            textFieldCount++;
        } else {
            console.log("Die maximale Anzahl von Textfeldern (5) wurde erreicht.");
        }
    });

    deleteButton.addEventListener("click", function() {

        if(textFieldContainer.firstChild) {
            textFieldContainer.removeChild(textFieldContainer.lastChild);
            textFieldCount--;
        }

    });


});