import com.intuit.karate.junit5.Karate;

class KarateBasicTest {
    @Karate.Test
    Karate testBasic() {
        return Karate.run("classpath:features/marvel_api/createCharacter.feature");
    }

}
