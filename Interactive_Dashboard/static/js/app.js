// from data.js
const tableData = merged_df;

// get table references
var tbody = d3.select("tbody");

function buildTable(merged_df) {
  // First, clear out any existing data
  tbody.html("");

  // Next, loop through each object in the data
  // and append a row and cells for each value in the row
  data.forEach((dataRow) => {
    // Append a row to the table body
    let row = tbody.append("tr");

    // Loop through each field in the dataRow and add
    // each value as a table cell (td)
    Object.values(dataRow).forEach((val) => {
      let cell = row.append("td");
      cell.text(val);
    });
  });
}

// 1. Create a variable to keep track of all the filters as an object.
var filters = {
occurrencedayofweek:"",
occurrencehour:"",
Month_: "",
Mean_temp: "",
};

// 3. Use this function to update the filters. 
function updateFilters() {

filters = {}; 

  // 4a. Save the element that was changed as a variable.
  // 4b. Save the value that was changed as a variable.
  let weekday = d3.select("#occurrencedayofweek").property("value");
  let hour = d3.select("#occurrencehour").property("value");
  let month = d3.select("#Month_").property("value");
  let temp = d3.select("#Mean_temp").property("value");


  // 4c. Save the id of the filter that was changed as a variable.
  
  // 5. If a filter value was entered then add that filterId and value
  // to the filters list. Otherwise, clear that filter from the filters object.

  if (weekday) {
    filters["occurrencedayofweek"]=weekday;
  }
  if (hour){
    filters["occurrencehour"]=hour;
  }
  if (month) {
    filters["Month_"]=month;
  }
  if (temp) {
    filters["Mean_temp"]=temp;
  }
  
    // 6. Call function to apply all filters and rebuild the table
  filterTable();
  
  }
  
  // 7. Use this function to filter the table when data is entered.
  function filterTable() {
  
    // 8. Set the filtered data to the tableData.
    var filteredData = data;
  
    // 9. Loop through all of the filters and keep any data that
    // matches the filter values
    for (var filterKey in filters){
      filteredData = filteredData.filter(row => row[filterKey] === filters[filterKey]);
    }
    
  
    // 10. Finally, rebuild the table using the filtered data
    buildTable(filteredData);
  }
  
  // 2. Attach an event to listen for changes to each filter
  d3.select("#occurrencedayofweek").on("change", updateFilters);
  d3.select("#occurrencehour").on("change", updateFilters);
  d3.select("#Month_").on("change", updateFilters);
  d3.select("#Mean_temp").on("change", updateFilters);

  // Build the table when the page loads
  buildTable(tableData);
