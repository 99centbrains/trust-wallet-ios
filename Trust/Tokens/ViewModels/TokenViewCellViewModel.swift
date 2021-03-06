// Copyright SIX DAY LLC. All rights reserved.

import Foundation
import UIKit
import BigInt

struct TokenViewCellViewModel {

    private let shortFormatter = EtherNumberFormatter.short

    let token: TokenObject
    let ticker: CoinTicker?

    init(
        token: TokenObject,
        ticker: CoinTicker?
    ) {
        self.token = token
        self.ticker = ticker
    }

    var title: String {
        return token.symbol
    }

    var titleFont: UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .medium)
    }

    var titleTextColor: UIColor {
        return Colors.black
    }

    var amount: String {
        return shortFormatter.string(from: BigInt(token.value) ?? BigInt(), decimals: token.decimals)
    }

    var currencyAmount: String? {
        let noResult = "-"
        guard let ticker = ticker else { return noResult }
        let tokenValue = CurrencyFormatter.plainFormatter.string(from: token.valueBigInt, decimals: token.decimals).doubleValue
        let amount = tokenValue * ticker.priceUSD
        guard amount > 0 else { return noResult }
        return CurrencyFormatter.formatter.string(from: NSNumber(value: amount))
    }

    var amountTextColor: UIColor {
        return Colors.black
    }

    var amountFont: UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .medium)
    }

    var currencyAmountTextColor: UIColor {
        return Colors.lightGray
    }

    var currencyAmountFont: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }

    var backgroundColor: UIColor {
        return .white
    }

    var image: UIImage? {
        return R.image.ethereumToken()
    }
}
