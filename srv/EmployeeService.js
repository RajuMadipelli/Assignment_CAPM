const cds = require("@sap/cds/libx/_runtime/cds");
module.exports = cds.service.impl( async function(){
    const { EmployeeSet } = this.entities;

    this.before('CREATE',EmployeeSet,(req,res)=>{
        var salary = Number(req.data.salaryAmount);
        var currcode = String(req.data.Currency_code);
        if(!(salary<50000 && currcode=="USD"))
        {
                req.error(500,"the salEmployee’s salary must be less than 50000 USD");
        }
        else console.log("create operation is sucessful");
    });

    this.before('UPDATE',EmployeeSet, async (req)=>{
        const ID = req.params[0];
        
        const results = await this.tx().run(
            SELECT.from(EmployeeSet).where({ID})
        );
        var namefirst=results[0].nameFirst;
        var loginname = results[0].loginName;
        if(req.data.nameFirst != namefirst && req.data.loginName != loginname)
            {
                req.error(500,"Operation not allowed");
            }
        else{
            console.log("operation sucessful");
        }
    })

    this.before('DELETE', EmployeeSet, async(req)=>{
        let id=req.data.ID;
        const info = await SELECT.from(EmployeeSet).columns('nameFirst').where ({ID:id});
        console.log(info[0].nameFirst[0]);
        if(info[0].nameFirst[0] == 'S'){
            req.error(500,'Operation Not Possible');
        }else{
            console.log('DELETE Operation Successful');
        }
    })


});