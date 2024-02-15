const baseUrl = "";
List<Map<String, dynamic>> serviceAvailabe = [
  {
    "name": "GST",
    "id": "gst",
    "price": "2000",
    "maxPrice": "",
    "desc":
        "GST Law in India is a comprehensive, multi-stage, destination-based tax.",
    "documetsRequired": ["PAN", "AADHAAR", "PHONE", "EMAIL"],
    "types": [
      "GST Registration",
      "GST Cancellation",
      "GST Returns",
      "GST Refund",
      "GST Annual Returns"
    ]
  },
  {
    "name": "IT Returns",
    "id": "it_returns",
    "price": "2000",
    "maxPrice": "6000",
    "desc":
        "Aaccounting treatment of issue of share capital, debenture and its redemption.",
    "documetsRequired": ["PAN", "AADHAAR", "PHONE", "EMAIL"],
    "types": [
      "Individual tax filling",
      "Corporate IT Filling",
      "TDS Return Filling",
      "Form 16 Issuance"
    ]
  },
  {
    "name": "PAN Card",
    "id": "pan",
    "price": "1000",
    "maxPrice": "2000",
    "desc":
        "PAN is a ten-digit number, issued by the Income Tax Department. You can apply for new card.",
    "documetsRequired": ["AADHAAR", "PHONE", "EMAIL"],
    "types": ["Pan creation"]
  },
  {
    "name": "Trade Mark",
    "id": "trade_mark",
    "price": "1000",
    "maxPrice": "3000",
    "desc":
        "Trademark is a special symbol, design or name that a company puts on its products.",
    "documetsRequired": ["AADHAAR", "PHONE", "EMAIL"],
    "types": ["Trademark", "IPR"]
  },
  {
    "name": "Comapny Reg.",
    "id": "company_registration",
    "price": "1000",
    "maxPrice": "3000",
    "desc": "Company is the basic form of an corporate entity in India.",
    "documetsRequired": ["AADHAAR", "PHONE", "EMAIL"],
    "types": ["Trademark", "IPR"]
  },
  {
    "name": "IT Services",
    "id": "it_services",
    "price": "1000",
    "maxPrice": '1000000',
    "desc": "All IT solutions from web to mobile provided here",
    "documetsRequired": ["none"],
    "types": ["Web Development", "Mobile Applocation", "Logo Designing"]
  }
];
