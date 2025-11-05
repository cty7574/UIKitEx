//
//  ViewModel.swift
//  ExpandableCardView
//
//  Created by 멘태 on 11/5/25.
//

final class ViewModel {
    var cards: [Card] = [
        Card(
            title: "Swift 성능 최적화 팁",
            content: "Swift 코드의 성능을 향상시키는 몇 가지 방법을 소개합니다. 먼저 값 타입과 참조 타입의 차이를 이해하고 적절히 활용하는 것이 중요합니다. struct는 스택에 저장되어 빠르지만, 큰 데이터의 경우 복사 비용이 발생할 수 있습니다. lazy 프로퍼티를 활용하면 실제로 필요한 시점에 초기화되어 메모리를 절약할 수 있습니다.",
            profileImage: "person.crop.circle.fill"
        ),
        Card(
            title: "iOS 17 새로운 기능",
            content: "iOS 17에서 추가된 대화형 위젯이 정말 인상적입니다. 이제 앱을 열지 않고도 위젯에서 직접 작업을 수행할 수 있어요.",
            profileImage: "star.circle.fill"
        ),
        Card(
            title: "오토레이아웃 디버깅",
            content: "오토레이아웃 문제를 해결할 때 유용한 팁들을 공유합니다. 첫째, View Hierarchy Debugger를 적극 활용하세요. 제약 조건의 우선순위를 조정하면 많은 문제가 해결됩니다. Content Hugging Priority와 Compression Resistance Priority의 차이를 명확히 이해하는 것이 중요합니다. 또한 Xcode의 디버그 콘솔에서 제약 조건 충돌 로그를 자세히 읽어보면 문제의 원인을 빠르게 파악할 수 있습니다.",
            profileImage: "hammer.circle.fill"
        ),
        Card(
            title: "SwiftUI vs UIKit",
            content: "두 프레임워크 각각의 장단점이 명확합니다. 프로젝트의 특성에 맞게 선택하는 것이 중요해요.",
            profileImage: "laptopcomputer"
        ),
        Card(
            title: "메모리 관리 베스트 프랙티스",
            content: "iOS 앱 개발에서 메모리 관리는 매우 중요한 주제입니다. ARC(Automatic Reference Counting)가 많은 부분을 자동으로 처리해주지만, 여전히 개발자가 주의해야 할 점들이 있습니다. 강한 참조 사이클을 방지하기 위해 weak와 unowned 키워드를 적절히 사용해야 합니다. 클로저에서 self를 캡처할 때 특히 주의가 필요하며, [weak self] 또는 [unowned self]를 사용하여 순환 참조를 방지할 수 있습니다. Instruments의 Leaks와 Allocations 도구를 정기적으로 사용하여 메모리 누수를 체크하는 습관을 들이면 좋습니다.",
            profileImage: "memorychip.fill"
        ),
        Card(
            title: "네트워킹 라이브러리 비교",
            content: "Alamofire와 URLSession을 비교해봤습니다. 간단한 요청은 URLSession으로 충분하지만, 복잡한 기능이 필요하다면 Alamofire가 편리합니다. 최근에는 async/await와 함께 URLSession을 사용하는 추세입니다.",
            profileImage: "network"
        ),
        Card(
            title: "코드 리뷰 문화",
            content: "좋은 코드 리뷰 문화를 만드는 것은 팀 전체의 성장에 도움이 됩니다.",
            profileImage: "person.2.circle.fill"
        ),
        Card(
            title: "앱 스토어 심사 대응",
            content: "앱 스토어 심사 reject 경험을 공유합니다. 가장 흔한 거절 사유는 가이드라인 2.1(앱 완성도), 4.2(최소 기능 요구사항), 5.1.1(데이터 수집 및 저장)입니다. 심사 노트를 자세히 작성하고, 테스트 계정을 제공하며, 필요한 경우 동영상으로 앱 기능을 설명하면 심사 통과율이 높아집니다. 거절당했을 때는 상세한 설명과 함께 어필하면 대부분 해결됩니다.",
            profileImage: "checkmark.shield.fill"
        ),
        Card(
            title: "CI/CD 구축기",
            content: "GitHub Actions로 iOS CI/CD 파이프라인을 구축한 경험을 공유합니다. 자동화된 테스트와 배포로 생산성이 크게 향상되었습니다.",
            profileImage: "arrow.triangle.2.circlepath.circle.fill"
        ),
        Card(
            title: "디자인 패턴 실전 적용",
            content: "MVC, MVP, MVVM, VIPER 등 다양한 아키텍처 패턴을 실제 프로젝트에 적용해본 경험을 바탕으로 각각의 장단점을 설명합니다. 프로젝트 규모와 팀 구성에 따라 적절한 패턴을 선택하는 것이 중요합니다. 작은 프로젝트는 MVC로도 충분하지만, 규모가 커질수록 MVVM이나 Clean Architecture를 고려해볼 만합니다.",
            profileImage: "building.2.crop.circle.fill"
        )
    ]
}
