




<nav class="navbar navbar-light bg-light">
    <div class="container text-center mr-5">
        <form class="form-inline" action="SearchServlet" method="post">

            <input required name="from"  class="form-control mr-sm-2 mt-1" type="search" placeholder="Source" aria-label="Search">

            <input required name="to" class="form-control mr-sm-2 mt-1" type="search" placeholder="Destination" aria-label="Search">

            <input required type="date" class="form-control mr-sm-2 mt-1" type="search" placeholder="MM/DD/YYYY" aria-label="Search" name="date"/>
            <select name="fQuantity" class="form-control mr-sm-2 mt-1 " >
                <option selected disabled>-Select Qty.-</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option disabled>-Max Qty. 5-</option>
            </select>

            <button class="btn btn-outline-success my-2 my-sm-0 mt-1" type="submit">Search</button>
        </form>
    </div>
</nav>