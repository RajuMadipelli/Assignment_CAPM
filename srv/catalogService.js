module.exports = cds.service.impl(async function() {
    const { productSet,purchaseorderSet } = this.entities;

    // Handle the READ request for Products
    this.on('highestprice', async (req) => {
        // Perform the query to get records where Price is greater than 1000
        const results = await this.tx().run(
            SELECT.from(productSet).where({ Price: { '>': 1000 } })
        );
        return results;
    });
    this.before("UPDATE",purchaseorderSet.drafts,(req,res)=>{
        var amount = Number(req.data.GROSS_AMOUNT)
        if(amount>4000)
       {
        req.error(500,"the amount is exceeded");
       }
    })
});