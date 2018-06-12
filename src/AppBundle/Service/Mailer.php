<?php

namespace AppBundle\Service;

use AppBundle\Entity\Reservation;

class Mailer
{
    protected $mailer;
    protected $templating;
    private $from ='reservation@flyaround.com';
    private $reply = "test@test.fr";
    private $name = "FlyAround";

    /**
     * Mailer constructor.
     * @param \Swift_Mailer $mailer
     * @param \Twig_Environment $templating
     */
    public function __construct(\Swift_Mailer $mailer, \Twig_Environment $templating)
    {
        $this->mailer = $mailer;
        $this->templating = $templating;
    }

    /**
     * @param $to
     * @param $subject
     * @param $body
     */
    protected function sendMail($to, $subject, $body)
    {
        $mail = \Swift_Message::newInstance();

        $mail
            ->setFrom($this->from,$this->name)
            ->setTo($to)
            ->setSubject($subject)
            ->setBody($body)
            ->setReplyTo($this->reply,$this->name)
            ->setContentType('text/html');

        $this->mailer->send($mail);
    }

    /**
     * @param Reservation $reservation
     * @throws \Twig_Error_Loader
     * @throws \Twig_Error_Runtime
     * @throws \Twig_Error_Syntax
     */
    public function sendMailPilot(Reservation $reservation)
    {
        $subject = 'Booking notification';
        $to = $reservation->getFlight()->getPilot()->getEmail();
        $body =  $this->templating->render('email/notification.html.twig',[
            'reservation' => $reservation]);

        $this->sendMail($to,$subject,$body);
    }

    /**
     * @param Reservation $reservation
     * @throws \Twig_Error_Loader
     * @throws \Twig_Error_Runtime
     * @throws \Twig_Error_Syntax
     */
    public function sendMailPassenger(Reservation $reservation)
    {
        $subject ='Booking confirmation';
        $to = $reservation->getPassenger()->getEmail();
        $body =  $this->templating->render('email/confirmation.html.twig',[
            'reservation' => $reservation]);

        $this->sendMail($to,$subject,$body);
    }
}
