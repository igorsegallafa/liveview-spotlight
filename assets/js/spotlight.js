window.onload = function() {
    let spotlight = document.getElementById('spotlight');
    let spotlight_results = document.querySelector('#spotlight .results');

    spotlight.addEventListener('keydown', handleKeyDown, false);
    spotlight_results.addEventListener('mousedown', handleSelectOption, false );
    spotlight_results.addEventListener('keyup', function(event){ event.preventDefault(); } );
    spotlight_results.addEventListener('keydown', function(event){ event.preventDefault(); } );
    spotlight_results.addEventListener('keypress', function(event){ event.preventDefault(); } );
}

let handleKeyDown = function(event) {
    if(event.key === "ArrowDown" || event.key === "ArrowUp") {
        let results_select = document.querySelector('#spotlight .results');
        let next_direction = event.key === "ArrowDown" ? 1 : event.key === "ArrowUp" ? -1 : 0;
        let option_selected = results_select.options[results_select.selectedIndex];
        let options = Array.from(results_select.options).filter(option => !option.disabled);
        let search_input = document.querySelector('#spotlight .search-input');

        let selected_id = option_selected ? parseInt(option_selected.value) : -1;
        let n = options.length;

        results_select.value = ((selected_id + next_direction) % n + n) % n;
        results_select.focus();

        //Restore focus to search input
        search_input.focus();

        event.preventDefault();
        return false;
    }
}

let handleSelectOption = function(event) {
    let results_select = document.querySelector('#spotlight .results');
    let option_selected = event.target;
    let selected_id = option_selected ? parseInt(option_selected.value) : -1;
    let search_input = document.querySelector('#spotlight .search-input');

    results_select.value = selected_id;
    results_select.focus();

    //Restore focus to search input
    search_input.focus();

    event.preventDefault();
    return false;
}