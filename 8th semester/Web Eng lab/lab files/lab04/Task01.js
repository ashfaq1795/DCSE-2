const item1 = document.getElementById('item1');
        const item2 = document.getElementById('item2');
        const item3 = document.getElementById('item3');

        const q1 = document.getElementById('q1');
        const q2 = document.getElementById('q2');
        const q3 = document.getElementById('q3');

        const c1 = document.getElementById('c1');
        const c2 = document.getElementById('c2');
        const c3 = document.getElementById('c3');

        const total = document.getElementById('tt');
        const percent = document.getElementById('percent');
        const grandtotal = document.getElementById('gtt');

        
        q1.addEventListener('input', calculate1);
        function calculate1() {
            const unitPrice = parseInt(item1.innerHTML);
            const quantity = parseInt(q1.value);
            const totalCost=unitPrice * quantity;
            c1.value = totalCost;
            finalCost();
        }
        
        q2.addEventListener('input', calculate2);
        function calculate2() {
            const unitPrice = parseInt(item2.innerHTML);
            const quantity = parseInt(q2.value);
            const totalCost=unitPrice * quantity;
            c2.value = totalCost;
            finalCost();
        }
        
        q3.addEventListener('input', calculate3);
        function calculate3() {
            const unitPrice = parseInt(item3.innerHTML);
            const quantity = parseInt(q3.value);
            const totalCost=unitPrice * quantity;
            c3.value = totalCost;
            finalCost();
        }

        function finalCost(){
            const totalprice=parseInt(c1.value) + parseInt(c2.value) + parseInt(c3.value);
            total.value=totalprice;
            const gst=(totalprice/100)*15;
            percent.value=gst;
            const fc=totalprice + gst;
            grandtotal.value=fc;
        }