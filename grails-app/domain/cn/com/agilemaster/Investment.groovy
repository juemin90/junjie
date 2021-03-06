package cn.com.agilemaster

/**
 * Investment : an investment task represents
 *
 */
class Investment{

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String title
    Project rootProject
    float projectSum /* unit as 10k RMB*/

    boolean isPaid = false

    User author

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [plan:InvestmentAction, actualPayment:InvestmentAction]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= [plan: 'investmentItem', actualPayment: 'paidItem']	// specifies which property should be used in a mapping

    static mapping = {
        plan (sort: 'paymentDate', batchSize: 10, order: 'desc')
        actualPayment( sort: 'paymentDate', order: 'desc')
    }

    static constraints = {
      //  title(size: 1..100, blank: false,unique: true)
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${rootProject?.name} --${work} ${projectSum} 万元";
	}
}
